package ER.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ER.annotation.Log;
import ER.dao.AddressDao;
import ER.entity.Address;
import ER.service.AddressService;


@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressDao addressDao;

	//address实体list
	public List<Address> getAllAddressList(){
		return addressDao.getAllAddressList();
	}
		
	//根据子分区查询
	public List<Address> getIdByC(String channel){
		return addressDao.getIdByC(channel);
	}
	
	//根据分区查询子分区
	public Address getIdByA(String aid){
		return addressDao.getIdByA(aid);
	}
		
	//统计用户最常访问的分区
	public Address getAddressByU(String uid){
		return addressDao.getAddressByU(uid);
	}
		
	//保存
	@Log
	public void addAddress(Address address) {
		addressDao.addAddress(address);
	}

}
