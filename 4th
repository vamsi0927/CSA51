#include <stdio.h>
#include <string.h>
#include <ctype.h> // for toupper() and isalpha()

void polyalpha(char *text, char *key) {
    int len = strlen(key);
    for (int i = 0; text[i]; i++) {
        char shift = toupper(key[i % len]) - 'A'; // Calculate shift based on key
        if (isalpha(text[i])) { // Process only alphabetic characters
            char base = isupper(text[i]) ? 'A' : 'a'; // Handle uppercase or lowercase
            text[i] = (text[i] - base + shift) % 26 + base; // Shift character
        }
    }
}

int main() {
    char text[100] = "HELLO"; // Plaintext
    char key[] = "KEY"; // Key for encryption
    polyalpha(text, key); // Encrypt the text
    printf("Encrypted: %s\n", text); // Output encrypted text
    return 0;
}
