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
    time_t last_modified;
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
        files->user_id = st.st_uid;
        files->last_modified = st.st_mtimespec.tv_sec;

        if (S_ISDIR(st.st_mode))
        {
            printf("%3u dirt %4hu %8lld bytes %8s %10ld\n", files->user_id, files->mode, files->file_size, files->file_name, files->last_modified);
        }
        else
        {
            printf("%3u file %4hu %8lld bytes %8s %10ld\n", files->user_id, files->mode, files->file_size, files->file_name, files->last_modified);
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