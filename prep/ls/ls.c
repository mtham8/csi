#include <dirent.h>
#include <stdio.h>
#include <sys/stat.h>

int main(void)
{
    DIR *directory;
    struct dirent *file;
    struct stat st;

    // open directory
    directory = opendir(".");
    if (directory == NULL)
    {
        perror("Unable to read directory");
        return (1);
    }

    // read directory
    while ((file = readdir(directory)))
    {
        char *name = file->d_name;
        stat(name, &st);
        int size;
        size = st.st_size;
        printf("%s: %d\n", name, size);
    }

    // close directory
    return closedir(directory);
}