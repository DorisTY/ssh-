package ER.dao;


import java.util.List;

import ER.entity.Address;

public interface AddressDao {
	
	//address实体list
	public List<Address> getAllAddressList();
	
	//根据分区查询子分区
	public List<Address> getIdByC(String channel);
		
	//根据子分区查询
	public Address getIdByA(String aid);
		
	//统计用户最常访问的分区
	public Address getAddressByU(String uid);
		
	//保存
	public void addAddress(Address address);
	
}
