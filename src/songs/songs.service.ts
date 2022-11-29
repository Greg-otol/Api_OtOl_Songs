import { Injectable } from '@nestjs/common';
import { SongDto } from './dto/songs.dto';
import { SongRepository } from './repository/song.repository';

@Injectable()
export class SongsService {
  constructor(private repository: SongRepository) {}

  async createSong(data: SongDto) {
    return await this.repository.create(data);
  }

  async findAllSongs() {
    return this.repository.findAll();
  }

  async findById(id: string) {
    return await this.repository.findById(id);
  }

  async updateSong(id: string, data: SongDto) {
    return await this.repository.update(id, data);
  }

  async deleteSong(id: string) {
    return await this.repository.delete(id);
  }
}
