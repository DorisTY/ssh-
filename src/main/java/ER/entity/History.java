package ER.entity;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "history")
public class History {

	private String hid;
	private Timestamp view_time;
	private String hstatus;// 0未删1已删

	private User user;// 观看者
	private Video video;

	public History() {

	}

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(name = "hid", length = 50)
	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	@Column(name = "view_time", length = 4)
	public Timestamp getView_time() {
		return view_time;
	}

	public void setView_time(Timestamp view_time) {
		this.view_time = view_time;
	}

	@Column(name = "hstatus", length = 1)
	public String getHstatus() {
		return hstatus;
	}

	public void setHstatus(String hstatus) {
		this.hstatus = hstatus;
	}

	@ManyToOne(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinColumn(name = "user", referencedColumnName = "uid")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinColumn(name = "video", referencedColumnName = "vid")
	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

}
