package com.skilldistillery.neighbors.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	
	@CreationTimestamp
	@Column(name = "create_date")
	private LocalDateTime createDate;
	@UpdateTimestamp
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;
	@Column(name = "image_url")
	private String imageUrl;
	
	@ManyToOne
	@JoinColumn(name = "neighborhood_id")
	private Neighborhood neighborhood;
	
	private boolean enabled;
	
	private Boolean attendance;
	
	 public boolean isEnabled() {
	        return enabled;
	    }
	
	public Event() {
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public LocalDateTime getCreateDate() {
		return createDate;
	}


	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}


	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}


	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}



	public Neighborhood getNeighborhood() {
		return neighborhood;
	}


	public void setNeighborhood(Neighborhood neighborhood) {
		this.neighborhood = neighborhood;
	}


	public boolean getEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	

	public Boolean getAttendance() {
		return attendance;
	}

	public void setAttendance(Boolean attendance) {
		this.attendance = attendance;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Event other = (Event) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [id=").append(id).append(", name=").append(name).append(", description=")
				.append(description).append(", createDate=").append(createDate).append(", lastUpdate=")
				.append(lastUpdate).append(", imageUrl=").append(imageUrl).append(", neighborhood=")
				.append(neighborhood).append(", enabled=").append(enabled).append(", attendance=").append(attendance)
				.append("]");
		return builder.toString();
	}


	


	
}
