import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { ISongs } from './dto/songs.dto';
import { SongsService } from './songs.service';

@Controller('songs')
export class SongsController {
  constructor(private readonly songsService: SongsService) {}

  @Post()
  async create(@Body() data: ISongs) {
    return this.songsService.create(data);
  }

  @Get()
  async findAll() {
    return this.songsService.findAll();
  }

  @Put(':id')
  async update(@Param('id') id: string, @Body() data: ISongs) {
    return this.songsService.update(id, data);
  }

  @Delete(':id')
  async delete(@Param('id') id: string) {
    return this.songsService.delete(id);
  }
}
