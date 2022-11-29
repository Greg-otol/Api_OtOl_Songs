import { Module } from '@nestjs/common';
import { SongsService } from './songs.service';
import { SongsController } from './songs.controller';
import { PrismaService } from 'src/database/PrismaService';
import { SongRepository } from './repository/song.repository';

@Module({
  controllers: [SongsController],
  providers: [SongsService, PrismaService, SongRepository],
})
export class SongsModule {}
