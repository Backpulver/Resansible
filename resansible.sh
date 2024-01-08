#!/bin/bash

perform_backup()
{
    echo "Select the OS for backup:"
    echo "1) Windows"
    echo "2) Linux"
    echo "3) Back to Main Menu"
    read -r os_choice

    case $os_choice in
        1) echo "Performing Windows backup...";;
        2) echo "Performing Linux backup...";;
        3) return;;
        *) echo "Invalid option"; perform_backup;;
    esac

    # ansible-playbook linux_backup.yml
    
    echo "Backup completed."
}

view_backup_files()
{
    echo "Listing backup files..."
    # ls ~/.backups/
}

show_menu()
{
    echo "1) Backup"
    echo "2) Restore"
    echo "3) View backup files"
    echo "4) Exit"
    echo -n "Enter your choice: "
    read -r choice

    case $choice in
        1) perform_backup; show_menu;;
        2) perform_restore; show_menu;;
        3) view_backup_files; show_menu;;
        4) exit 0;;
        *) echo "Invalid option"; show_menu;;
    esac
}

show_menu
