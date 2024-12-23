
### Explanation:
- **`-o output.txt`:** The script now accepts an `-o` option for specifying an output file. If this option is used, all validated resources from either a single domain (`-u`) or multiple domains (`-d`) are appended to the specified output file (`output.txt` in this case).
- **Appending Output:** The script appends the results to the `OUTPUT_FILE` with a newline after each domain's resources.

### Usage:
1. **Download validated resources for a single domain and save to `output.txt`:**
   ```bash
   git clone https://github.com/Ashadowkhan/subdomainfinder.git
   cd subdomainfinder
   chmod +x ./subdomain_finder.sh
   ./subdomain_finder.sh -u target.com -o output.txt
   ```
   This will download the validated resources for `target.com` and save them to `output.txt`.

2. **Download validated resources for multiple domains listed in `domains.txt` and save to `output.txt`:**
   ```bash
   ./subdomain_finder.sh -d domains.txt -o output.txt
   ```
   This will download the validated resources for each domain in `domains.txt` and append them to `output.txt`.

3. **Download validated resources for a single domain without specifying an output file:**
   ```bash
   ./subdomain_finder.sh -u target.com
   ```
   This will download the validated resources for `target.com` and save them to `target.com_valid_resources.txt`.

4. **Download validated resources for multiple domains without specifying an output file:**
   ```bash
   ./subdomain_finder.sh -d domains.txt
   ```
   This will download the validated resources for each domain in `domains.txt` and save them in individual files.

### Example `domains.txt`:
```
example.com
google.com
yahoo.com
```

### Script Execution:
- Running `./subdomain_finder.sh -u google.com -o output.txt` will append `google.com` validated subdomains to `output.txt`.
- Running `./subdomain_finder.sh -d domains.txt -o output.txt` will append all validated subdomains from each domain in `domains.txt` to `output.txt`.

This approach gives you flexibility in saving outputs either separately or all into one file.
