**Description of the Changes:**

The function was refactored from a series of `if...else` statements to use a configuration object (`configs`) that maps environment names to their respective configuration objects. Instead of checking each environment with conditional logic, the function now simply looks up the configuration by key. If the provided environment is not found, it defaults to the `development` configuration.

**Benefits:**

1. **Improved Readability:**  
   The configuration for each environment is clearly organized and easy to scan, making the code more readable.

2. **Easier Maintenance:**  
   Adding, removing, or updating environment configurations is straightforward—just edit the `configs` object. There’s no need to modify or add new conditional branches.

3. **Reduced Code Duplication:**  
   The default configuration is handled in one place, avoiding repeated code for fallback logic.

4. **Scalability:**  
   As more environments are added, the code remains clean and manageable, without growing in complexity.

5. **Fewer Errors:**  
   Centralizing configuration reduces the risk of mistakes that can occur when duplicating logic across multiple `if...else` blocks.
