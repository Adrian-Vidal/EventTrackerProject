export class NeighborhoodEvent {
  id: number;
  name: string;
  description: string;
  createDate: string | undefined;
  lastUpdate: string | undefined;
  imageUrl: string;
  enabled: boolean;

constructor(
  id: number = 0,
  name: string = '',
  description: string = '',
  createDate: string = '',
  lastUpdate: string = '',
  imageUrl: string = '',
  enabled: boolean = true
) {
  this.id = id;
  this.name = name;
  this.description = description;
  this.createDate = createDate;
  this.lastUpdate = lastUpdate;
  this.imageUrl = imageUrl;
  this.enabled = enabled;
  }
}
