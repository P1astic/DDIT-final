package kr.or.ddit.airport.service.serviceimpl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.airport.mapper.AirportHomeMapper;
import kr.or.ddit.airport.service.AirportHomeService;

@Service
public class AirportHomeServiceImpl implements AirportHomeService{

	@Inject
	AirportHomeMapper airportHomeMapper;
	
}
