-- CreateTable
CREATE TABLE "Artists" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Artists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Songs" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "coverImageUrl" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "clipYoutubeUrl" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Songs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Genders" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Genders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "nickname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "isAdmin" BOOLEAN NOT NULL DEFAULT false,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FavoriteArtists" (
    "id" TEXT NOT NULL,
    "profile_id" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FavoriteArtists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ArtistsToSongs" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ArtistsToGenders" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ArtistsToProfile" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ArtistsToFavoriteArtists" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Artists_name_key" ON "Artists"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Songs_coverImageUrl_key" ON "Songs"("coverImageUrl");

-- CreateIndex
CREATE UNIQUE INDEX "Genders_name_key" ON "Genders"("name");

-- CreateIndex
CREATE UNIQUE INDEX "User_nickname_key" ON "User"("nickname");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_cpf_key" ON "User"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "FavoriteArtists_profile_id_key" ON "FavoriteArtists"("profile_id");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistsToSongs_AB_unique" ON "_ArtistsToSongs"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistsToSongs_B_index" ON "_ArtistsToSongs"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistsToGenders_AB_unique" ON "_ArtistsToGenders"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistsToGenders_B_index" ON "_ArtistsToGenders"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistsToProfile_AB_unique" ON "_ArtistsToProfile"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistsToProfile_B_index" ON "_ArtistsToProfile"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtistsToFavoriteArtists_AB_unique" ON "_ArtistsToFavoriteArtists"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtistsToFavoriteArtists_B_index" ON "_ArtistsToFavoriteArtists"("B");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FavoriteArtists" ADD CONSTRAINT "FavoriteArtists_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistsToSongs" ADD CONSTRAINT "_ArtistsToSongs_A_fkey" FOREIGN KEY ("A") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistsToSongs" ADD CONSTRAINT "_ArtistsToSongs_B_fkey" FOREIGN KEY ("B") REFERENCES "Songs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistsToGenders" ADD CONSTRAINT "_ArtistsToGenders_A_fkey" FOREIGN KEY ("A") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistsToGenders" ADD CONSTRAINT "_ArtistsToGenders_B_fkey" FOREIGN KEY ("B") REFERENCES "Genders"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistsToProfile" ADD CONSTRAINT "_ArtistsToProfile_A_fkey" FOREIGN KEY ("A") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistsToProfile" ADD CONSTRAINT "_ArtistsToProfile_B_fkey" FOREIGN KEY ("B") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistsToFavoriteArtists" ADD CONSTRAINT "_ArtistsToFavoriteArtists_A_fkey" FOREIGN KEY ("A") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtistsToFavoriteArtists" ADD CONSTRAINT "_ArtistsToFavoriteArtists_B_fkey" FOREIGN KEY ("B") REFERENCES "FavoriteArtists"("id") ON DELETE CASCADE ON UPDATE CASCADE;
