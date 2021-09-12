#include <stdio.h>
#include <dirent.h>
#include <string.h>
#include <sys/stat.h>

#include <limits.h>

typedef struct
{
    char file_name[NAME_MAX];
    off_t file_size;
    mode_t mode;
    uid_t user_id;
} file_entry;

static int count_files(DIR *directory, struct dirent *reader);
static void populate_file_entries(DIR *directory, struct dirent *reader, file_entry files[]);

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
    int number_of_files = count_files(directory, readdir(directory));
    file_entry files[number_of_files];

    // reset directory stream
    rewinddir(directory);
    populate_file_entries(directory, readdir(directory), files);

    printf("Total Files: %d\n", number_of_files);

    // close directory
    return closedir(directory);
}

void populate_file_entries(DIR *directory, struct dirent *reader, file_entry files[])
{
    struct stat st;
    while ((reader = readdir(directory)))
    {
        strcpy(files->file_name, reader->d_name);
        char *name = reader->d_name;
        stat(name, &st);
        int size;
        size = st.st_size;
        files->file_size = size;
        files->mode = st.st_mode;

        if (S_ISDIR(st.st_mode))
        {
            printf("%4hu %8lld bytes %4s\n", files->mode, files->file_size, files->file_name);
        }
        else
        {
            printf("%4hu %8lld bytes %4s\n", files->mode, files->file_size, files->file_name);
        }
        files++;
    }
}

int count_files(DIR *directory, struct dirent *file_reader)
{
    int num_files = 0;
    while ((file_reader = readdir(directory)))
    {
        num_files++;
    }
    return num_files;
}