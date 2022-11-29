import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/PrismaService';
import { SongDto } from '../dto/songs.dto';

@Injectable()
export class SongRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: SongDto) {
    return await this.prisma.songs.create({ data });
  }

  async findAll() {
    return await this.prisma.songs.findMany();
  }

  async findById(id: string) {
    return await this.prisma.songs.findFirstOrThrow({
      where: { id },
    });
  }

  async update(id: string, data: SongDto) {
    return await this.prisma.songs.update({
      where: { id },
      data,
    });
  }

  async delete(id: string) {
    return await this.prisma.songs.delete({
      where: { id },
    });
  }
}
