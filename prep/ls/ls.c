#include <dirent.h>
#include <stdio.h>

int main(void)
{
    DIR *directory;
    struct dirent *file;

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
        printf("%s\n", file->d_name);
    }

    // close directory
    return closedir(directory);
}