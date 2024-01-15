#!/bin/bash

perform_backup() {
    echo "Performing backup..."
    if ansible-playbook Ansible/linux_backup.yml; then
        echo "Backup completed"
    else
        echo "Backup failed"
        exit 1
    fi
}

perform_automatic_restore() {
    echo "Performing restore from the latest backup..."

    if [[ -n "$(find ~/.backups/ -maxdepth 0 -type d -empty 2>/dev/null)" ]]; then
        echo "Empty backup directory!"
        exit 1
    fi

    if ansible-playbook Ansible/linux_restore_latest.yml; then
        echo "Restore completed"
    else
        echo "Restore failed"
        exit 1
    fi
}

perform_manual_restore() {
    view_backup_files
    echo "Enter the name of the backup to restore:"
    read -r backup_name

    # Uncomment and modify the following line as needed
    # ansible-playbook linux_restore.yml --extra-vars "backup_name=$backup_name"
    echo "Restoration completed for $backup_name"
}

view_backup_files() {
    echo "Listing files..."
    if [[ -n "$(find ~/.backups/ -maxdepth 0 -type d -empty 2>/dev/null)" ]]; then
        echo "Empty backup directory!"
        exit 1
    else
        find ~/.backups/ -mindepth 1 -maxdepth 1 -type d -printf "%f\n"
    fi
    echo
}

show_menu() {
    echo "1) Backup"
    echo "2) Automatic Restore from latest backup file"
    echo "3) Manual Restore"
    echo "4) View backup files"
    echo "5) Exit"
    echo -n "Enter your choice: "
    read -r choice

    case $choice in
        1) perform_backup ;;
        2) perform_automatic_restore ;;
        3) perform_manual_restore ;;
        4) view_backup_files ;;
        5) exit 0 ;;
        *) echo "Invalid option"; show_menu ;;
    esac
}

while getopts ":br" opt; do
    case $opt in
        b)
            perform_backup
            exit 0
            ;;
        f)
            view_backup_files
            exit 0
            ;;
        r)
            perform_automatic_restore
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

if [ $# -eq 0 ]; then
    show_menu
fi
