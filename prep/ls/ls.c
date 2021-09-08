#include <dirent.h>
#include <stdio.h>
#include <sys/stat.h>

#include <limits.h>

typedef struct
{
    char fileName[NAME_MAX];
    off_t fileSize;
} fileEntry;

static int countFiles(DIR *directory, struct dirent *reader);

int main(void)
{
    DIR *directory;
    struct dirent *reader;
    struct stat st;
    int numberOfFiles;

    // open directory
    directory = opendir(".");
    if (directory == NULL)
    {
        perror("Unable to read directory");
        return (1);
    }

    // read directory
    while ((reader = readdir(directory)))
    {
        char *name = reader->d_name;
        stat(name, &st);
        int size;
        size = st.st_size;
        printf("%s: %d bytes\n", name, size);
        numberOfFiles++;
    }

    // Total Files from func: 32767
    printf("Total Files from func: %d\n", countFiles(directory, readdir(directory)));

    // Total Files inline: 7
    printf("Total Files inline: %d\n", numberOfFiles);

    // close directory
    return closedir(directory);
}

int countFiles(DIR *directory, struct dirent *fileReader)
{
    int numFiles;
    while ((fileReader = readdir(directory)))
    {
        numFiles++;
    }
    return numFiles;
}