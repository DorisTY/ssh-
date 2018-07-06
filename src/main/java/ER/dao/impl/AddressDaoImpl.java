package ER.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import ER.basedao.impl.BaseDao;
import ER.dao.AddressDao;
import ER.entity.Address;
import ER.entity.History;

@Repository
public class AddressDaoImpl extends BaseDao<Address,Long> implements AddressDao{
	
	//address实体list
	public List<Address> getAllAddressList(){
		List<Address> addressList=getListByHQL("from Address");
		return addressList;
	}
	
	//根据分区查询子分区
	public List<Address> getIdByC(String channel) {
		String hql = "from Address u where u.channel = ?"; 
		List<Address> address = getListByHQL(hql,new Object[]{channel}); 
		return address;
	}
	
	//根据子分区查询
	public Address getIdByA(String aid) {
		String hql = "from Address u where u.aid = ?"; 
		Address address = getByHQL(hql,new Object[]{aid}); 
		return address;
	}
	
	//统计用户最常访问的分区
	public Address getAddressByU(String uid) {
		String hql = "select max(c) from Address u where (select count(*) c from History h where h.user.uid = ? group by h.video.aid.channel) a group by c"; 
		Address  address= getByHQL(hql,new Object[]{uid}); 
		return address;
	}
			
	//保存
	@Override
	public void addAddress(Address address){
        save(address);   
   }

	
}
