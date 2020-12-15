package cdc.go.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cdc.go.domain.DomesticVO;
import cdc.go.domain.WorldSearch;
import cdc.go.domain.WorldVO;

@Repository
public class CovidDAOImpl implements CovidDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "cdc.go.mapper.CovidMapper";
	
	@Override
	public List<DomesticVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	//추가
	@Override
	public List<WorldVO> listWorld() throws Exception{
		return session.selectList(namespace + ".listAllWorld");
	}
	
	//인자 추가
	@Override
	public List<WorldVO> listAllWorld(WorldSearch WS) throws Exception{
		return session.selectList(namespace + ".listAllWorld", WS);
	}
}
