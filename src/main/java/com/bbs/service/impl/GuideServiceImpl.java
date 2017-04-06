package com.bbs.service.impl;
import java.util.List;
import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bbs.dao.PhoneDao;
import com.bbs.entity.Phone;
import com.bbs.service.GuideService;

@Service
public class GuideServiceImpl implements GuideService {

	@Autowired
	private PhoneDao phoneDao;


	@Override
	public List<Phone> find(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		DetachedCriteria  critera = DetachedCriteria.forClass(Phone.class);
		int bid = map.get("bid");
		int price = map.get("price");
		int sid = map.get("sid");
		int ram = map.get("ram");
		int rom = map.get("rom");
		int battery = map.get("battery");
		int pre_camera = map.get("pre_camera");
		int pos_camera = map.get("pos_camera");
		int net = map.get("net");
		int coid = map.get("coid");
		if(bid>0){
			critera.add(Restrictions.eq("brand.bid", bid));			
		}
		if(price>0){
			switch (price) {
			case 1:critera.add(Restrictions.le("price", 1000));break;
			case 2:critera.add(Restrictions.between("price", 1000, 2000));break;
			case 3:critera.add(Restrictions.between("price", 2000, 3000));break;
			case 4:critera.add(Restrictions.between("price", 3000, 4000));break;
			case 5:critera.add(Restrictions.ge("price", 4000));break;
			}
		}
		if(sid>0){
			critera.createAlias("psystem", "psystem").add(Restrictions.eq("psystem.sid", sid));
		}

		if(ram>0){
			critera.add(Restrictions.ge("ram", ram));		
		}
		if(rom>0){
			critera.add(Restrictions.ge("rom", rom));		
		}
		if(battery>0){
			switch (battery) {	
			case 1:critera.add(Restrictions.between("battery", 2000, 2500));break;
			case 2:critera.add(Restrictions.between("battery", 2500, 3000));break;
			case 3:critera.add(Restrictions.between("battery", 3000, 3500));break;
			case 4:critera.add(Restrictions.ge("battery", 3500));break;
			}		
		}
		if(pre_camera>0){
				switch (pre_camera) {
				case 1:critera.add(Restrictions.le("pre_camera", 500));break;
				case 2:critera.add(Restrictions.between("pre_camera", 500, 800));break;
				case 3:critera.add(Restrictions.between("pre_camera", 800, 1200));break;
				case 4:critera.add(Restrictions.ge("pre_camera", 1200));break;
				}			
		}
		if(pos_camera>0){
			switch (pos_camera) {
			case 1:critera.add(Restrictions.le("pos_camera", 500));break;
			case 2:critera.add(Restrictions.between("pos_camera", 500, 800));break;
			case 3:critera.add(Restrictions.between("pos_camera", 800, 1200));break;
			case 4:critera.add(Restrictions.between("pos_camera", 1200, 1600));break;
			case 5:critera.add(Restrictions.ge("pos_camera", 1600));break;
			}			
	}
		if(net>0){
			critera.createAlias("netSupport", "netSupport").add(Restrictions.eq("netSupport.nid", net));		
		}
			
		if(coid>0){
			critera.createAlias("colors", "color").add(Restrictions.eq("color.coid", coid));	
		}


		return phoneDao.findByCriteria(critera);
	}


	@Override
	public List<Phone> findAll() {
		
		return phoneDao.findAll();
	}


	@Override
	public List<Phone> findByBid(int bid) {
		
		return phoneDao.findByBid(bid);
	}

}
