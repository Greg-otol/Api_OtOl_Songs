import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/PrismaService';
import { ISongs } from './dto/songs.dto';

@Injectable()
export class SongsService {
  constructor(private prisma: PrismaService) {}

  async create(data: ISongs) {
    const songExist = await this.prisma.songs.findFirst({
      where: {
        id: data.id,
      },
    });

    if (songExist) {
      throw new Error('Song already exists');
    }

    const song = await this.prisma.songs.create({
      data,
    });

    return song;
  }

  async findAll() {
    return this.prisma.songs.findMany();
  }

  async update(id: string, data: ISongs) {
    const songExist = await this.prisma.songs.findUnique({
      where: {
        id,
      },
    });

    if (!songExist) {
      throw new Error('Song does not exist');
    }

    return await this.prisma.songs.update({
      data,
      where: {
        id,
      },
    });
  }

  async delete(id: string) {
    const songExist = await this.prisma.songs.findUnique({
      where: {
        id,
      },
    });

    if (!songExist) {
      throw new Error('Song does not exists');
    }

    return await this.prisma.songs.delete({
      where: {
        id,
      },
    });
  }
}
