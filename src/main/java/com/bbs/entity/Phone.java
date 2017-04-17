package com.bbs.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
@Table(name="t_phone",uniqueConstraints = {@UniqueConstraint(columnNames="model")})
public class Phone {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="pid")
	private int pid;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="bid")
	private Brand brand;
	@Column(name="model")
	private String model;
	@Column(name="img")
	private String img;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="nid")
	private NetSupport netSupport;
	@Column(name="price")
	private int price;
	@Column(name="lwh")
	private String lwh;
	@Column(name="weight")
	private int weight;
	@Column(name="ram")
	private int ram;
	@Column(name="rom")
	private int rom;
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="phone_color",
	joinColumns={@JoinColumn(name="pid",referencedColumnName="pid")},
	inverseJoinColumns={@JoinColumn(name="coid",referencedColumnName="coid")})
	private Set<Color> colors;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="sid")
	private PSystem psystem;
	@Column(name="battery")
	private int battery;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="cid")
	@Cascade(value=CascadeType.SAVE_UPDATE)
	private CPU cpu;
	@Column(name="pre_camera")
	private int pre_camera;
	@Column(name="pos_camera")
	private int pos_camera;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="phone",orphanRemoval=true)
	private Set<Topic> topics;
	@Column(name="countTopic")
	private int countTopic;
	
	
	public int getCountTopic() {
		return countTopic;
	}
	public void setCountTopic(int countTopic) {
		this.countTopic = countTopic;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public NetSupport getNetSupport() {
		return netSupport;
	}
	public void setNetSupport(NetSupport netSupport) {
		this.netSupport = netSupport;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLwh() {
		return lwh;
	}
	public void setLwh(String lwh) {
		this.lwh = lwh;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getRam() {
		return ram;
	}
	public void setRam(int ram) {
		this.ram = ram;
	}
	public int getRom() {
		return rom;
	}
	public void setRom(int rom) {
		this.rom = rom;
	}
	public Set<Color> getColors() {
		return colors;
	}
	public void setColors(Set<Color> colors) {
		this.colors = colors;
	}
	public PSystem getPsystem() {
		return psystem;
	}
	public void setPsystem(PSystem psystem) {
		this.psystem = psystem;
	}
	public int getBattery() {
		return battery;
	}
	public void setBattery(int battery) {
		this.battery = battery;
	}
	public CPU getCpu() {
		return cpu;
	}
	public void setCpu(CPU cpu) {
		this.cpu = cpu;
	}
	public int getPre_camera() {
		return pre_camera;
	}
	public void setPre_camera(int pre_camera) {
		this.pre_camera = pre_camera;
	}
	public int getPos_camera() {
		return pos_camera;
	}
	public void setPos_camera(int pos_camera) {
		this.pos_camera = pos_camera;
	}
	public Set<Topic> getTopics() {
		return topics;
	}
	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	@Override
	public String toString() {
		return "Phone [pid=" + pid + ", brand=" + brand + ", model=" + model + ", img=" + img + ", netSupport="
				+ netSupport + ", price=" + price + ", lwh=" + lwh + ", weight=" + weight + ", ram=" + ram + ", rom="
				+ rom + ", colors=" + colors + ", psystem=" + psystem + ", battery=" + battery + ", cpu=" + cpu
				+ ", pre_camera=" + pre_camera + ", pos_camera=" + pos_camera + ", topics=" + topics +"]";
	}
	



}
