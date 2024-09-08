package com.skilldistillery.neighbors.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Resident {
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
@Column(name = "first_name")
private String firstName;
@Column(name = "last_name")
private String lastName;
private String email;
@Column(name = "image_url")
private String imageUrl;
private String username;
private String password;

@ManyToOne
@JoinColumn(name = "neighborhood_id")
private Neighborhood neighborhood;


public Resident() {
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getFirstName() {
	return firstName;
}

public void setFirstName(String firstName) {
	this.firstName = firstName;
}

public String getLastName() {
	return lastName;
}

public void setLastName(String lastName) {
	this.lastName = lastName;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getImageUrl() {
	return imageUrl;
}

public void setImageUrl(String imageUrl) {
	this.imageUrl = imageUrl;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public Neighborhood getNeighborhood() {
	return neighborhood;
}

public void setNeighborhood(Neighborhood neighborhood) {
	this.neighborhood = neighborhood;
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
	Resident other = (Resident) obj;
	return id == other.id;
}

@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("Resident [id=").append(id).append(", firstName=").append(firstName).append(", lastName=")
			.append(lastName).append(", email=").append(email).append(", imageUrl=").append(imageUrl)
			.append(", username=").append(username).append(", password=").append(password).append("]");
	return builder.toString();
}


}
