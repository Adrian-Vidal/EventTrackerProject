export class NeighborhoodEvent {
  id: number;
  name: string;
  description: string;
  createDate: string;
  lastUpdate: string;
  imageUrl: string;
  enabled: boolean;
  attendance: boolean;
  neighborhood: { id: number };

constructor(
  id: number = 0,
  name: string = '',
  description: string = '',
  createDate: string = '',
  lastUpdate: string = '',
  imageUrl: string = '',
  enabled: boolean = true,
  attendance: boolean = false,
  neighborhood: { id: number } = { id: 1 },

) {
  this.id = id;
  this.name = name;
  this.description = description;
  this.createDate = createDate;
  this.lastUpdate = lastUpdate;
  this.imageUrl = imageUrl;
  this.enabled = enabled;
  this.attendance = attendance;
  this.neighborhood = neighborhood;
  }
}
