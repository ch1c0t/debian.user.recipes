overwrite_symlink_dir_files() {
    # Check if both arguments are provided
    if [[ -z "$1" || -z "$2" ]]; then
        echo "Usage: symlink_dir_files <source_dir> <dest_dir>"
        return 1
    fi

    # Resolve absolute paths for source and destination directories
    local src_dir="${1:A}"
    local dest_dir="${2:A}"

    # Verify that the source directory exists
    if [[ ! -d "$src_dir" ]]; then
        echo "Error: Source directory '$src_dir' does not exist."
        return 1
    fi

    # Create destination directory if it doesn't exist
    if [[ ! -d "$dest_dir" ]]; then
        mkdir -p "$dest_dir"
    fi

    # Loop through all files in the source directory
    # (N) ignores error if empty, (D) includes hidden files
    for src_file in "$src_dir"/*(ND); do
        # Ensure it's a regular file or symlink (skips subdirectories)
        if [[ -f "$src_file" ]]; then
            local file_name="${src_file:t}"
            # -s creates a symbolic link, -f forces it by overwriting existing items
            ln -sf "$src_file" "$dest_dir/$file_name"
        fi
    done
}
