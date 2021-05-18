package com.a.b.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.a.b.dao.BDao;
import com.a.b.dto.urlVO;

public class textService implements IBoarderService{
	private SqlSession sqlSession = Constant.sqlSession;
	private int ebookno;
	private String pathname;
	
//	@Autowired
//	ApplicationContext context; 적용안됀다
	
	public textService(String bno) {
		ebookno = Integer.parseInt(bno);
		
		
	}
	
	public textService(String bno, String pathname) {
		ebookno = Integer.parseInt(bno);
		this.pathname = pathname;
	}

	@Override
	public void execute(Model model) {
		System.out.println(ebookno);
		int a = ebookno;
		String Realpath = pathname;
		//String Realpath = "C:/ebook/";
		//String Realpath = "C:/Users/pc374/Desktop/useEbook/";
		//urlVO info1 = (urlVO)context.getBean(urlVO.class);
		BDao dao = sqlSession.getMapper(BDao.class);
		String txt1 = dao.contentview(a).getbRealContent();
		System.out.println("텍스트서비스시스템:"+txt1);
		
		// 김병찬씨컴퓨터 경로/bclob객체이름
		File file = new File(Realpath, txt1);
		
		try {
			System.out.println( "결과 : " + IOUtils.toString( new FileInputStream( file ) ) );
			txt1 = IOUtils.toString( new FileInputStream( file ));
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("txt1", txt1);
		
		// TODO Auto-generated method stub
//		String txt1 = null;
//		
//		File file = new File( "C:/text_file/txt1.txt" );
//	    BufferedReader br = null;
//	    try {
//	        StringBuilder builder = new StringBuilder();
//	        br = new BufferedReader( new InputStreamReader( new FileInputStream( file ) ) );
//	        while( true ) {
//	            String buffer = br.readLine();
//	            if( buffer == null ) {
//	                break;
//	            }
//	            builder.append( buffer );
//	            builder.append( "\n" );
//	        }
//	        //System.out.println( "결과 : " + builder.toString() );
//	        txt1 = builder.toString();
//	     }
//	     catch( Exception e ) {
//	        e.printStackTrace();
//	     }
//	     finally {
//	        if( br != null ) {
//	            try {
//					br.close();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//	         }
//	      }
//	    System.out.println(txt1);
//	    model.addAttribute("txt1", txt1);
//	    }
	
	}
}
	


