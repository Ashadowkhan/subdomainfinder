#!/bin/bash

OUTPUT_FILE=""

# Function to download the list of validated resources for a domain
download_valid_resources() {
  DOMAIN=$1
  if [ -n "$OUTPUT_FILE" ]; then
    echo "Downloading validated resources for domain: $DOMAIN into $OUTPUT_FILE"
    curl -s "https://shrewdeye.app/domains/$DOMAIN.txt?valid=true" >> "$OUTPUT_FILE"
    echo -e "\n" >> "$OUTPUT_FILE"  # Add a new line after each domain's resources
  else
    echo "Downloading validated resources for domain: $DOMAIN"
    curl -s "https://shrewdeye.app/domains/$DOMAIN.txt?valid=true" -o "${DOMAIN}_valid_resources.txt"
    echo "Validated resources saved to ${DOMAIN}_valid_resources.txt"
  fi
}

# Function to process a file containing a list of domains
process_domains_file() {
  FILE=$1
  if [[ ! -f $FILE ]]; then
    echo "File $FILE does not exist!"
    exit 1
  fi

  while IFS= read -r DOMAIN; do
    download_valid_resources "$DOMAIN"
  done < "$FILE"
}

# Function to download validated resources for a single domain
download_single_domain() {
  DOMAIN=$1
  download_valid_resources "$DOMAIN"
}

# Parse command-line arguments
while getopts "d:u:o:" opt; do
  case $opt in
    d)
      FILE=$OPTARG
      ;;
    u)
      DOMAIN=$OPTARG
      ;;
    o)
      OUTPUT_FILE=$OPTARG
      ;;
    *)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# If no options are provided, display usage information
if [ $OPTIND -eq 1 ]; then
  echo "Usage: ./subdomain_finder.sh [-d domains.txt] [-u target.com] [-o output.txt]"
  exit 1
fi

# Execute based on provided arguments
if [ -n "$FILE" ]; then
  process_domains_file "$FILE"
elif [ -n "$DOMAIN" ]; then
  download_single_domain "$DOMAIN"
fi

if [ -n "$OUTPUT_FILE" ]; then
  echo "All validated resources have been saved to $OUTPUT_FILE"
fi
