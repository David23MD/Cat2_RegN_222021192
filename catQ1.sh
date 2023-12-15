#!/bin/bash

# Check if no command line argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <positive_integer>"
    exit 1 
fi

# Check if the command line argument is a positive integer
if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Please provide a positive integer as a command line argument."
    exit 1
fi

# Function to calculate the sum of digits
get_digit_sum() {
    local num=$1
    local sum=0

    while [ "$num" -gt 0 ]; do
        digit=$((num % 10))
        sum=$((sum + digit))
        num=$((num / 10))
    done

    echo "$sum"
}

# Function to calculate the product of digits
get_digit_product() {
    local num=$1
    local product=1

    while [ "$num" -gt 0 ]; do
        digit=$((num % 10))
        product=$((product * digit))
        num=$((num / 10))
    done

    echo "$product"
}

# Function to check if a number is palindrome
is_palindrome() {
    local num=$1
    local reversed=0
    local original=$num

    while [ "$num" -gt 0 ]; do
        digit=$((num % 10))
        reversed=$((reversed * 10 + digit))
        num=$((num / 10))
    done

    [ "$original" -eq "$reversed" ]
}

# Function to check if a number is prime
is_prime() {
    local num=$1

    if [ "$num" -lt 2 ]; then
        return 1
    fi

    for ((i = 2; i <= num / 2; i++)); do
        if [ "$((num % i))" -eq 0 ]; then
            return 1
        fi
    done

    return 0
}

# Main script logic based on user's choice
echo "Choose an operation:"
echo "1. Display the sum and product of the digits"
echo "2. Display whether the number is a palindrome or not"
echo "3. Display whether the number is prime or not"

read -p "Enter your choice (1/2/3): " choice

case $choice in
    1)
        sum=$(get_digit_sum "$1")
        product=$(get_digit_product "$1")
        echo "Sum of digits: $sum"
        echo "Product of digits: $product"
        ;;
    2)
        if is_palindrome "$1"; then
            echo "The number is a palindrome."
        else
            echo "The number is not a palindrome."
        fi
        ;;
    3)
        if is_prime "$1"; then
            echo "The number is prime."
        else
            echo "The number is not prime."
        fi
        ;;
    *)
        echo "Invalid choice. Please choose 1, 2, or 3."
        exit 1
        ;;
esac

