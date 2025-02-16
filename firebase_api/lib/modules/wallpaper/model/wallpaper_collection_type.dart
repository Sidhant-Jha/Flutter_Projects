enum WallpaperCollectionType { private, public}

WallpaperCollectionType mapToWallpaperType(String name)
{
  switch(name) 
  {
    case 'private': return WallpaperCollectionType.private;
    case 'public' : return WallpaperCollectionType.public;
    default: return WallpaperCollectionType.private;
  }
}