package ER.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "address")
public class Address {

	private String aid;//子分区
	private String channel;//分区

	public Address() {

	}

	@Id
	@GeneratedValue(generator = "aid")
	@GenericGenerator(name = "aid", strategy = "assigned")
	@Column(name = "aid", length = 50)
	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	@Column(name = "channel", length = 50)
	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

}
