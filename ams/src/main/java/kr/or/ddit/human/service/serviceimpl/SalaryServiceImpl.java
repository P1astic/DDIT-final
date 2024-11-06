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
import kr.or.ddit.human.mapper.SalaryMapper;
import kr.or.ddit.human.service.SalaryService;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.SalaryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SalaryServiceImpl implements SalaryService {

	@Inject
	UploadController uploadController;
	
	@Inject
	SalaryMapper salaryMapper;
	
	@Override
	public List<SalaryVO> paystubList(Map<String, Object> paystubMap) {
		// TODO Auto-generated method stub
		return this.salaryMapper.paystubList(paystubMap);
	}

	@Override
	public int getpaystubTotal(Map<String, Object> paystubMap) {
		// TODO Auto-generated method stub
		return this.salaryMapper.getpaystubTotal(paystubMap);
	}

	@Override
	public List<EmployeeVO> empList(DeptVO deptVO) {
		// TODO Auto-generated method stub
		return this.salaryMapper.empList(deptVO);
	}

	@Override
	public int registpaystub(Map<String, Object> request) throws IOException, DocumentException {
		
		// PDF로 만들 HTML 태그 가지고오기
		String htmlContent = (String) request.get("paystubPdf");

		String fileName = request.get("fileNm") + ".pdf";
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		
        
        //PDF 문서 생성 로직 시작
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        PdfWriter writer = PdfWriter.getInstance(document, byteArrayOutputStream);
        document.open();
        
        // CSS 및 폰트 설정
        StyleAttrCSSResolver cssResolver = new StyleAttrCSSResolver();
        XMLWorkerFontProvider font = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
        font.register("C:/sts-bundle/workspace/ams/src/main/webapp/resources/fonts/NanumGothic.ttf", "NanumGothic");
        CssAppliersImpl cssAppliers = new CssAppliersImpl(font);
        
        // HTML 파이프라인 설정
        HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
        htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
        PdfWriterPipeline pdfPipeline = new PdfWriterPipeline(document, writer);
        HtmlPipeline htmlPipeline = new HtmlPipeline(htmlContext, pdfPipeline);
        CssResolverPipeline cssResolverPipeline = new CssResolverPipeline(cssResolver, htmlPipeline);
        
        // XML 파서로 HTML 내용을 PDF로 변환
        XMLWorker worker = new XMLWorker(cssResolverPipeline, true);
        XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
        StringReader strReader = new StringReader(htmlContent);
        xmlParser.parse(strReader);
        
        document.close();
        // PDF 생성 로직 끝

        // 생성된 PDF 업로드 로직
        // ByteArrayOutputStream에 PDF 데이터를 바이트 배열로 변환
        byte[] pdfBytes = byteArrayOutputStream.toByteArray();
        
        //MultiparFile 객체로 변환
        MultipartFile pdfFile = new MockMultipartFile("file", fileName, "application/pdf", pdfBytes);
        
        // DB에 저장될 fileGroupNo 반환
        long fileGruopNo = this.uploadController.singleFileUpload(pdfFile);
        Map<String, Object> salaryMap = (Map<String, Object>) request.get("salaryVO");
        
        
        SalaryVO salaryVO = new SalaryVO();
        salaryVO.setSalaryDate((String) salaryMap.get("SALARY_DATE"));
        salaryVO.setMemId((String) salaryMap.get("MEM_ID"));
        salaryVO.setFamily((int) salaryMap.get("FAMILY"));
        salaryVO.setOvertime((int) salaryMap.get("OVERTIME"));
        salaryVO.setNight((int) salaryMap.get("NIGHT"));
        salaryVO.setHoliday((int) salaryMap.get("HOLIDAY"));
        salaryVO.setDayoff((int) salaryMap.get("DAYOFF"));
        salaryVO.setJobgrade((int) salaryMap.get("JOBGRADE"));
        salaryVO.setWorkday((int) salaryMap.get("WORKDAY"));
        salaryVO.setWorkhour((int) salaryMap.get("WORKHOUR"));
        salaryVO.setHourWage((int) salaryMap.get("HOUR_WAGE"));
        salaryVO.setDayWage((int) salaryMap.get("DAY_WAGE"));
        salaryVO.setMonthWage((int) salaryMap.get("MONTH_WAGE"));
        salaryVO.setSalaryTax((int) salaryMap.get("SALARY_TAX"));
        salaryVO.setSalaryBslry((int) salaryMap.get("SALARY_BSLRY"));
        salaryVO.setSumWage((int) salaryMap.get("SUM_WAGE"));
        salaryVO.setPension((int) salaryMap.get("PENSION"));
        salaryVO.setHealth((int) salaryMap.get("HEALTH"));
        salaryVO.setEmployee((int) salaryMap.get("EMPLOYEE"));
        salaryVO.setIncomeTax((int) salaryMap.get("INCOME_TAX"));
        salaryVO.setTotalWage((int) salaryMap.get("TOTAL_WAGE"));
        salaryVO.setFileGroupNo(fileGruopNo);
        
        log.info("salaryVO + " + salaryVO);
        
        byteArrayOutputStream.close();
        // 생성된 PDF 업로드 로직 끝
        
	    return this.salaryMapper.registpaystub(salaryVO);
	}

	@Override
	public Map<String, String> paystubImage(SalaryVO salaryVO) {
		// TODO Auto-generated method stub
		
		FileDetailVO result = this.salaryMapper.paystubImage(salaryVO);
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

}
