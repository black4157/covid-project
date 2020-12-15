package cdc.go.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cdc.go.domain.DomesticVO;
import cdc.go.domain.WorldSearch;
import cdc.go.domain.WorldVO;
import cdc.go.persistence.CovidDAO;

@Service
public class CovidServiceImpl implements CovidService{
	
	@Inject
	private CovidDAO dao;
	
	
	@Override
	public List<DomesticVO> listAll() throws Exception{
		return dao.listAll();
	}
	
	//추가
	@Override
	public List<WorldVO> listWorld() throws Exception{
		return dao.listWorld();
	}
	
	
	//인자 추가
	@Override
	public List<WorldVO> listAllWorld(WorldSearch WS) throws Exception{
		return dao.listAllWorld(WS);
	}
}
