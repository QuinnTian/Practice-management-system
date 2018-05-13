package com.sict.biz;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.annotation.Resource;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.wltea.analyzer.lucene.IKAnalyzer;
import com.sict.dao.KnowledgeDao;
import com.sict.dao.OrgDao;
import com.sict.dao.StudentDao;
import com.sict.entity.Knowledge;
import com.sict.entity.Student;
import com.sict.service.DictionaryService;

/**
 * 聊天服务类
 * 
 * @author liufeng
 * @date 2013-12-01
 */
@Service
public class ChatService {
	@Resource
	KnowledgeDao knowledgeDao;
	@Resource
	OrgDao orgDao;
	@Resource @Qualifier("studentDao")
	StudentDao studentDao;

	/**
	 * 得到索引存储目录
	 * 
	 * @return WEB-INF/classes/index/
	 */
	public String getIndexDir() {
		// 得到.class文件所在路径（WEB-INF/classes/）
		String classpath = ChatService.class.getResource("/").getPath();
		// 将classpath中的%20替换为空格
		classpath = classpath.replaceAll("%20", " ");
		// 索引存储位置：WEB-INF/classes/index/
		return classpath + "index/";
		// return "F:/indexDir";
	}

	int pageknowlege;

	/**
	 * 创建索引
	 */
	public String createIndex(String stu_id) {
		// 取得问答知识库中的所有记录
		Student student = studentDao.selectStuByStu_id(stu_id);
		stu_id = student.getId();
		String class_id = student.getClass_id();
		// 通过班级编号和组织级别选出系
		String department_id = orgDao.selectOrgByCocde(
				DictionaryService.findOrg(student.getClass_id()).getOrg_code(),
				"5").getParent_id();
		// 通过系和组织级别选出学院
		String college_id = orgDao.selectOrgByCocde(
				DictionaryService.findOrg(department_id).getOrg_code(), "3")
				.getParent_id();
		// /通过组织级别和学院选出学校
		String school_id = orgDao.selectOrgByCocde(
				DictionaryService.findOrg(college_id).getOrg_code(), "2")
				.getParent_id();
		// 建立问题的模型对象
		List<Knowledge> knowledgeList = new ArrayList<Knowledge>();
		List<Knowledge> knowledgecollege_id = knowledgeDao
				.findAllKnowledge(college_id);
		knowledgeList.addAll(knowledgecollege_id);
		List<Knowledge> knowledgeclass_id = knowledgeDao
				.findAllKnowledge(class_id);
		knowledgeList.addAll(knowledgeclass_id);
		List<Knowledge> knowledgedepartment_id = knowledgeDao
				.findAllKnowledge(department_id);
		knowledgeList.addAll(knowledgedepartment_id);
		List<Knowledge> knowledgeschool_id = knowledgeDao
				.findAllKnowledge(school_id);
		knowledgeList.addAll(knowledgeschool_id);
		Directory directory = null;
		IndexWriter indexWriter = null;
		try {
			directory = FSDirectory.open(new File(getIndexDir()));
			IndexWriterConfig iwConfig = new IndexWriterConfig(
					Version.LUCENE_46, new IKAnalyzer(true));
			indexWriter = new IndexWriter(directory, iwConfig);
			Document doc = null;
			// 遍历问答知识库创建索引
			for (Knowledge knowledge : knowledgeList) {
				String tsStr = "";
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
				tsStr = sdf.format(knowledge.getCreate_time());
				doc = new Document();
				// 对question进行分词存储
				doc.add(new TextField("question", knowledge.getQuestion(),
						Store.YES));
				doc.add(new TextField("question", DictionaryService.findOrg(
						knowledge.getScope()).getOrg_name(), Store.YES));
				/*
				 * doc.add(new TextField("question", DictionaryService
				 * .findTeacher(knowledge.getScope()).getTrue_name(),
				 * Store.YES));
				 */
				// 对id、answer和category不分词存储
				doc.add(new StringField("id", knowledge.getId(), Store.YES));
				doc.add(new StringField("answer", knowledge.getAnswer(),
						Store.YES));
				doc.add(new IntField("category", knowledge.getCategory(),
						Store.YES));
				doc.add(new StringField("tsStr", tsStr, Store.YES));
				doc.add(new StringField("messenger_id", knowledge
						.getMessenger_id(), Store.YES));
				indexWriter.addDocument(doc);
			}
			indexWriter.commit();
			indexWriter.close();
			directory.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stu_id;
	}

	/**
	 * 更新索引 by ccc 20150126
	 */
	public void updateIndex(String stu_id) {
		// 取得问答知识库中的所有记录
		Student student = studentDao.selectStuByStu_id(stu_id);
		stu_id = student.getId();
		String class_id = student.getClass_id();
		// 通过班级编号和组织级别选出系
		String department_id = orgDao.selectOrgByCocde(
				DictionaryService.findOrg(student.getClass_id()).getOrg_code(),
				"5").getParent_id();
		// 通过系和组织级别选出学院
		String college_id = orgDao.selectOrgByCocde(
				DictionaryService.findOrg(department_id).getOrg_code(), "3")
				.getParent_id();
		// /通过组织级别和学院选出学校
		String school_id = orgDao.selectOrgByCocde(
				DictionaryService.findOrg(college_id).getOrg_code(), "2")
				.getParent_id();
		List<Knowledge> knowledgeList = new ArrayList<Knowledge>();
		List<Knowledge> knowledgecollege_id = knowledgeDao
				.findAllKnowledge(college_id);
		knowledgeList.addAll(knowledgecollege_id);
		List<Knowledge> knowledgeclass_id = knowledgeDao
				.findAllKnowledge(class_id);
		knowledgeList.addAll(knowledgeclass_id);
		List<Knowledge> knowledgedepartment_id = knowledgeDao
				.findAllKnowledge(department_id);
		knowledgeList.addAll(knowledgedepartment_id);
		List<Knowledge> knowledgeschool_id = knowledgeDao
				.findAllKnowledge(school_id);
		knowledgeList.addAll(knowledgeschool_id);
		Directory directory = null;
		IndexWriter indexWriter = null;
		try {
			directory = FSDirectory.open(new File(getIndexDir()));
			IndexWriterConfig iwConfig = new IndexWriterConfig(
					Version.LUCENE_46, new IKAnalyzer(true));
			indexWriter = new IndexWriter(directory, iwConfig);
			Document doc = null;
			// 遍历问答知识库创建索引
			for (Knowledge knowledge : knowledgeList) {
				// 将timestamp 的时间转换成string 型的时间
				String tsStr = "";
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
				tsStr = sdf.format(knowledge.getCreate_time());
				doc = new Document();
				// 对question进行分词存储
				doc.add(new TextField("question", knowledge.getQuestion(),
						Store.YES));
				doc.add(new TextField("question", DictionaryService.findOrg(
						knowledge.getScope()).getOrg_name(), Store.YES));
				// 对id、answer和category不分词存储
				doc.add(new StringField("id", knowledge.getId(), Store.YES));
				doc.add(new StringField("answer", knowledge.getAnswer(),
						Store.YES));
				doc.add(new IntField("category", knowledge.getCategory(),
						Store.YES));
				doc.add(new StringField("tsStr", tsStr, Store.YES));
				doc.add(new StringField("messenger_id", knowledge
						.getMessenger_id(), Store.YES));
				// Term term = new Term("id", knowledge.getId());
				// indexWriter.deleteDocuments(term);
				indexWriter.updateDocument(new Term("id", knowledge.getId()
						+ ""), doc);
			}
			indexWriter.commit();
			indexWriter.close();
			directory.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 从索引文件中根据问题检索答案
	 * 
	 * @param content
	 * @return Knowledge
	 */
	@SuppressWarnings("deprecation")
	private List<Knowledge> searchIndex(String content, int pageIndex,
			int pageSize,String  stu_id) {
		List<Knowledge> k = new ArrayList<Knowledge>();
		try {
			Directory directory = FSDirectory.open(new File(getIndexDir()));
			IndexReader reader = IndexReader.open(directory);
			IndexSearcher searcher = new IndexSearcher(reader);
			// 使用查询解析器创建Query
			QueryParser questParser = new QueryParser(Version.LUCENE_46,
					"question", new IKAnalyzer(true));
			Query query = questParser.parse(QueryParser.escape(content));
			// 检索得分最高的文档
			TopDocs topDocs = searcher.search(query, 100);
			Student s=DictionaryService.findStudent(stu_id);
			s.setAll_knowlege_page(topDocs.totalHits);
		    DictionaryService.updateStudent(s);
			Knowledge.knowsize=DictionaryService.findStudent(stu_id).getAll_knowlege_page();
			if (pageIndex > topDocs.totalHits) {
				k = null;
			} else if(pageIndex<=0){
				k=null;
			}else {
				if (pageIndex <= topDocs.totalHits && topDocs.totalHits > 0) {
					ScoreDoc[] scoreDoc = topDocs.scoreDocs;
					System.out.println("ccvvvb"+scoreDoc.length);
					// 分页显示，start为每页第一个索引，end是最后一个索引，pagesize是每页显示条数，pageindex是第几页
					int start = (pageIndex - 1) * pageSize;
					System.out.println("cc这是几页c" + start);
					int end = pageIndex * pageSize;
					for (int i = start; i <end; i++) {
						Document doc = searcher.doc(scoreDoc[i].doc);
						Knowledge knowledge = new Knowledge();
						knowledge.setId(doc.getField("id").stringValue());
						knowledge.setQuestion(doc.get("question"));
						knowledge.setAnswer(doc.get("answer"));
						knowledge.setCategory(doc.getField("category")
								.numericValue().intValue());
						knowledge.setMessenger_id(doc.get("messenger_id"));
						// 将string的时间转换成timestamp 型的时间
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyy-MM-dd");
						java.util.Date date = sdf.parse(doc.get("tsStr"));
						Timestamp ts = new Timestamp(date.getTime());
						knowledge.setCreate_time(ts);
						k.add(knowledge);
						System.out.println("woyaokande" + k);
					}
				}
			}
			reader.close();
			directory.close();
		} catch (Exception e) {
			k = null;
			e.printStackTrace();
		}
		return k;

	}

	/**
	 * 聊天方法（根据question返回answer）
	 * 
	 * @param openId
	 *            用户的OpenID
	 * @param createTime
	 *            消息创建时间
	 * @param question
	 *            用户上行的问题
	 * @return answer
	 */
	public String chat(String openId, String createTime, String question,
			int pageIndex, int pageSize,String stu_id) {
		String answer = "null";
	
		int chatCategory = 0;
		List<Knowledge> knowledge = searchIndex(question, pageIndex, pageSize,stu_id);
		System.out.println("knowledgecc" + knowledge);
		String ret = "";
		if (knowledge == null) {
			answer = getDefaultAnswer();
			chatCategory = 0;
			ret = answer;
		} else if (knowledge.size() == 0) {
			answer = getDefaultAnswer();
			chatCategory = 0;
			ret = answer;
		} else {
			for (int j = 0; j < knowledge.size(); j++) {
				// 笑话

				if (2 == knowledge.get(j).getCategory()) {
				}
				// 普通对话
				else {
					answer = knowledge.get(j).getAnswer();
					// 如果答案为空，根据知识id从问答知识分表中随机获取一条
					if ("".equals(answer))
						chatCategory = 1;
					String tsStr = "";
					ret="";
					DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
					tsStr = sdf.format(knowledge.get(j).getCreate_time());
					System.out.println("这是得到的时间" + tsStr);
					System.out.println("我们每个人的Knowledge.knowsize"
							+ Knowledge.knowsize);
					if (pageIndex == 1) {
						ret =  "一共有" + Knowledge.knowsize + "条,可回复下一页进行查看";
					}
					ret = ret+"第"+ pageIndex+ "条"
							+ "题目：\n"+ knowledge.get(j).getQuestion()
							+ "\n"+ "解答：\n"
							+ answer+ "\n"
							+ "发布人:\n"+ DictionaryService.findTeacher(
									knowledge.get(j).getMessenger_id())
									.getTrue_name() + "\n" + "发布时间：\n" + tsStr
							+ "\n";

				}
			}
		}

		return ret;

	}

	public int getknowsize(String stu_id) {
		Knowledge.knowsize=DictionaryService.findStudent(createIndex(stu_id)).getAll_knowlege_page();
		
		int t = Knowledge.knowsize;
		System.out.println("WOXIANGYAK"+t);
		return t;
	}

	/**
	 * 随机获取一个默认的答案
	 * 
	 * @return
	 */
	private String getDefaultAnswer() {
		String[] answer = { "要不我们聊点别的？", "恩？你到底在说什么呢？", "没有听懂你说的，能否换个说法？",
				"虽然不明白你的意思，但我却能用心去感受", "听的我一头雾水，阁下的知识真是渊博呀，膜拜~",
				"真心听不懂你在说什么，要不你换种表达方式如何？", "哎，我小学语文是体育老师教的，理解起来有点困难哦",
				"是世界变化太快，还是我不够有才？为何你说话我不明白？" };
		return answer[getRandomNumber(answer.length)];
	}

	/**
	 * 随机生成 0~length-1 之间的某个值
	 * 
	 * @return int
	 */
	private int getRandomNumber(int length) {
		Random random = new Random();
		return random.nextInt(length);
	}
}
