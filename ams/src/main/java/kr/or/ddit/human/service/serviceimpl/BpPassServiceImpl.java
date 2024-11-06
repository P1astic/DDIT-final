package kr.or.ddit.human.service.serviceimpl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import kr.or.ddit.comn.util.UploadController;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.human.mapper.BpPassMapper;
import kr.or.ddit.human.service.BpPassService;
import kr.or.ddit.human.vo.PassRegistVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BpPassServiceImpl implements BpPassService {
	
	@Inject
	UploadController uploadController;
	
	@Inject
	BpPassMapper bpPassMapper;
	

	@Override
	public int requestRegistPdf(Map<String, Object> request) throws IOException, DocumentException {
		// TODO Auto-generated method stub
		
		String htmlContent = (String) request.get("requestRegistPdf");
		
		String fileName = request.get("fileNm") +".pdf";
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        PdfWriter writer = PdfWriter.getInstance(document, byteArrayOutputStream);
        document.open();
		
        StyleAttrCSSResolver cssResolver = new StyleAttrCSSResolver();
//      try (FileInputStream cssStream = new FileInputStream("C:/sts-bundle/workspace/ams/src/main/webapp/resources/css/salary/registSalary.css")) {
//          cssResolver.addCss(XMLWorkerHelper.getCSS(cssStream));
//      } catch (FileNotFoundException e) {
//          throw new IOException("CSS 파일을 찾을 수 없습니다: " + e.getMessage());
//      }
        
        XMLWorkerFontProvider font = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
        font.register("C:/sts-bundle/workspace/ams/src/main/webapp/resources/fonts/NanumGothic.ttf", "NanumGothic");
        CssAppliersImpl cssAppliers = new CssAppliersImpl(font);
        
        HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
        htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
        
        PdfWriterPipeline pdfPipeline = new PdfWriterPipeline(document, writer);
        HtmlPipeline htmlPipeline = new HtmlPipeline(htmlContext, pdfPipeline);
        CssResolverPipeline cssResolverPipeline = new CssResolverPipeline(cssResolver, htmlPipeline);
        
        XMLWorker worker = new XMLWorker(cssResolverPipeline, true);
        XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
        
        StringReader strReader = new StringReader(htmlContent);
        xmlParser.parse(strReader);
        
        document.close();
        
        byte[] pdfBytes = byteArrayOutputStream.toByteArray();
        
        MultipartFile pdfFile = new MockMultipartFile("file", fileName, "application/pdf", pdfBytes);
        
        long fileGroupNo = this.uploadController.singleFileUpload(pdfFile);
        Map<String, Object> passMap = (Map<String, Object>) request.get("passRegistVO");
        
        PassRegistVO passRegistVO = new PassRegistVO();
        passRegistVO.setMemId((String) passMap.get("MEM_ID"));
        passRegistVO.setPassRegistAplyYmd((String) passMap.get("PASS_REGIST_APLY_YMD"));
        passRegistVO.setPassRegistTitle((String) passMap.get("PASS_REGIST_TITLE"));
        passRegistVO.setPassRegistYn((String) passMap.get("PASS_REGIST_YN"));
        passRegistVO.setFileGroupNo(fileGroupNo);
        
        log.info("passRegistVO :" + passRegistVO);
        
        byteArrayOutputStream.close();
        
		return this.bpPassMapper.requestRegistPdf(passRegistVO);
	}


	@Override
	public List<PassRegistVO> requestList(Map<String, Object> requestMap) {
		// TODO Auto-generated method stub
		return this.bpPassMapper.requestList(requestMap);
	}


	@Override
	public int getRequestTotal(Map<String, Object> requestMap) {
		// TODO Auto-generated method stub
		return this.bpPassMapper.getRequestTotal(requestMap);
	}


	@Override
	public Map<String, String> passRequestImage(PassRegistVO passRegistVO) {
		// TODO Auto-generated method stub
		FileDetailVO result = this.bpPassMapper.passRequestImage(passRegistVO);
		String pdfFilePath = result.getFileFilePathNm();
		String pdfOriginalName = result.getFileOrgnlFileNm();
		
		Map<String, String> response = new HashMap<>();
		try {
	        PDDocument document = PDDocument.load(new File(pdfFilePath));
	        
	        // PDF 첫 페이지를 이미지로 변환
	        PDFRenderer pdfRenderer = new PDFRenderer(document);
	        BufferedImage image = pdfRenderer.renderImageWithDPI(0, 300); // 300 DPI로 변환

	        // 이미지를 ByteArrayOutputStream으로 변환
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        ImageIO.write(image, "png", baos);
	        byte[] imageBytes = baos.toByteArray();

	        // Base64로 인코딩
	        String base64Image = Base64.getEncoder().encodeToString(imageBytes);

	        document.close();
	        
	        response.put("image", base64Image);
	        response.put("filePath", pdfFilePath);
	        response.put("fileOriginalName", pdfOriginalName);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return response;
	}


	@Override
	public int requestAccept(PassRegistVO passRegistVO) {
		// TODO Auto-generated method stub
		return this.bpPassMapper.requestAccept(passRegistVO);
	}


	@Override
	public int requestDecline(PassRegistVO passRegistVO) {
		// TODO Auto-generated method stub
		return this.bpPassMapper.requestDecline(passRegistVO);
	}

}
