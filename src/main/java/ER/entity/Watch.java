package ER.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "watch")
public class Watch {

	private String wid;
	private int commenttime;
	private int favortime;
	private int liketime;


	public Watch() {

	}

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(name = "wid", length = 50)
	public String getWid() {
		return wid;
	}

	public void setWid(String wid) {
		this.wid = wid;
	}

	@Column(name = "commenttime")
	public int getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(int commenttime) {
		this.commenttime = commenttime;
	}

	@Column(name = "favortime")
	public int getFavortime() {
		return favortime;
	}

	public void setFavortime(int favortime) {
		this.favortime = favortime;
	}

	@Column(name = "liketime")
	public int getLiketime() {
		return liketime;
	}

	public void setLiketime(int liketime) {
		this.liketime = liketime;
	}


}
