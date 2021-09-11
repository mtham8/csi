#include <dirent.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

#include <limits.h>

typedef struct
{
    char fileName[NAME_MAX];
    off_t fileSize;
} fileEntry;

static int countFiles(DIR *directory, struct dirent *reader);
static void populateFileEntries(DIR *directory, struct dirent *reader, fileEntry files[]);

int main(void)
{
    DIR *directory;

    // open directory
    directory = opendir(".");
    if (directory == NULL)
    {
        perror("Unable to read directory");
        return (1);
    }
    int numberOfFiles = countFiles(directory, readdir(directory));
    fileEntry files[numberOfFiles];

    // reset directory stream
    rewinddir(directory);
    populateFileEntries(directory, readdir(directory), files);

    printf("Total Files: %d\n", numberOfFiles);

    // close directory
    return closedir(directory);
}

void populateFileEntries(DIR *directory, struct dirent *reader, fileEntry files[])
{
    struct stat st;
    while ((reader = readdir(directory)))
    {
        strcpy(files->fileName, reader->d_name);
        char *name = reader->d_name;
        stat(name, &st);
        int size;
        size = st.st_size;
        files->fileSize = size;
        printf("%s: %lld bytes\n", files->fileName, files->fileSize);
        files++;
    }
}

int countFiles(DIR *directory, struct dirent *fileReader)
{
    int numFiles = 0;
    while ((fileReader = readdir(directory)))
    {
        numFiles++;
    }
    return numFiles;
}