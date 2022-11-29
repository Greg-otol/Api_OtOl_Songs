import {
  BadRequestException,
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
  Res,
} from '@nestjs/common';
import { Response } from 'express';
import { SongDto } from './dto/songs.dto';
import { SongsService } from './songs.service';

@Controller('song')
export class SongsController {
  constructor(private readonly songsService: SongsService) {}

  @Post()
  async create(@Body() data: SongDto, @Res() response: Response) {
    const result = await this.songsService.createSong(data);

    if (result) {
      return response.status(201).send(result);
    }

    return response.status(400).send('Bad request');
  }

  @Get()
  async findAll(@Res() response: Response) {
    const allSongs = await this.songsService.findAllSongs();
    if (allSongs.length === 0) {
      return response.status(404).send('Songs not found');
    }

    return response.status(200).send(allSongs);
  }

  @Get(':id')
  async findById(@Param('id') id: string, @Res() response: Response) {
    const song = await this.songsService.findById(id);

    return response.status(200).send(song);
  }

  @Put(':id')
  async update(
    @Param('id') id: string,
    @Body() data: SongDto,
    @Res() response: Response,
  ) {
    const updatedSong = await this.songsService.updateSong(id, data);

    return response.status(200).send(updatedSong);
  }

  @Delete(':id')
  async delete(@Param('id') id: string) {
    const deletedSong = await this.songsService.deleteSong(id);

    return `Song '${deletedSong.title}', successfully deleted`;
  }
}
