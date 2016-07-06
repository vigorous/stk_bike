package com.stk.controller.business.realalarm;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.StatisticsBikeVO;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.FirstPageFacade;
import com.stk.controller.base.BaseController;
import com.stk.entity.Page;
import com.stk.util.Const;
import com.stk.util.DateUtil;
import com.stk.util.PageData;
import com.stk.util.Tools;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/survey")
public class SurveyController extends BaseController {
	
	/**
	 * 跳转到概况列表页
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/surveyList")
	public ModelAndView surveyList(Page page)throws Exception{
		
		FirstPageFacade f = FacadeFactory.getFirstPageFacade();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		UserVO user = (UserVO)session.getAttribute(Const.SESSION_USER);
		
		PageData pd = new PageData(this.getRequest());
		
		Date sTime = null;
		Date eTime = null;
		String startTime = pd.getString("START_TIME");
		String endTime = pd.getString("END_TIME");
		String bikeSource = pd.getString("BIKE_SOURCE");
		
		//如果日期为空，则设置一个默认值
		if(Tools.notEmpty(startTime)){
			sTime = DateUtil.fomatDate(startTime);
		}else{
			sTime = DateUtil.fomatDate("2000-01-01");
		}
		if(Tools.notEmpty(endTime)){
			eTime = DateUtil.fomatDate(endTime);
		}else{
			eTime = DateUtil.fomatDate("2030-01-01");
		}
		//统计公安局车辆信息（车辆总数、被盗车辆数量、寻回车辆数量）
		List<StatisticsBikeVO> list = f.statisticsBikeByPoliceOffice(user.getPOLICE_OFFICE_ID(), sTime, eTime, bikeSource);
		
		//配置柱状图json数据
		List<String> names = new ArrayList<String>();
		List<Integer> totalBike  = new ArrayList<Integer>();
		List<Integer> lostBike = new ArrayList<Integer>();
		List<Integer> recoverBike = new ArrayList<Integer>();
		
		for(StatisticsBikeVO vo : list){
			names.add(vo.getNAME());
			totalBike.add(vo.getCARS_COUNT());
			lostBike.add(vo.getLOST_CARS_COUNT());
			recoverBike.add(vo.getBACK_CARS_COUNT());
		}
		
		//饼状图
		List<List> ls = new ArrayList<List>();
		for(int i=1; i<list.size(); i++){
			List sonList = new ArrayList();
			sonList.add(list.get(i).getNAME());
			sonList.add(list.get(i).getCARS_COUNT());
			ls.add(sonList);
		}
		
		
		/* 柱状图显示 */
		JSONArray namesJson = JSONArray.fromObject(names);				//名称
		JSONArray totalBikeJson = JSONArray.fromObject(totalBike);		//车辆总数集合
		JSONArray lostBikeJson = JSONArray.fromObject(lostBike);		//被盗车辆集合
		JSONArray recoverBikeJson = JSONArray.fromObject(recoverBike);	//寻回车辆集合
		
		ModelAndView mv = this.getModelAndView();
		/* 表格数据 */
		mv.addObject("page", page);
		mv.addObject("list", list);
		
		/* 柱状图数据 */
		mv.addObject("namesJson", namesJson.toString());
		mv.addObject("totalBikeJson", totalBikeJson.toString());
		mv.addObject("lostBikeJson", lostBikeJson.toString());
		mv.addObject("recoverBikeJson", recoverBikeJson.toString());
		/* 饼状图 */
		mv.addObject("ls", JSONArray.fromObject(ls));
		
		mv.setViewName("business/realAlarm/survey/surveyList");
		return mv;
	}
}
