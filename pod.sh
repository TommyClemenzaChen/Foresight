#!/bin/bash

# file for different nautilus commands

show_help() {
    echo "Usage: $0 <command> [arguments]"
    echo "Available commands:"
    echo "  create <filepath>          - Create resource from file"
    echo "  delete <name>              - Delete specific resource"
    echo "  help                       - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 create ./deployment.yaml"
    echo "  $0 delete pod my-pod"

}

create() {
    if [ -z "$1" ]; then
        echo "Error: Please provide the file path"
        exit 1
    fi

    kubectl create -f $1
}

delete_pod() {
    if [ -z "$1" ]; then
        echo "Error: Please provide the name of the pod to delete"
        exit 1
    fi
    kubectl delete pod --now $1
}

# Main script logic
case "$1" in
    create)
        create $2
        ;;
    delete)
        delete_pod $2
        ;;
    help)
        show_help
        ;;
    *)
        echo "Error: Invalid command"
        show_help
        exit 1
        ;;
esac