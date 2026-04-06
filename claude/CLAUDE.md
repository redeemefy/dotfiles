# Global Development Conventions

These conventions apply to **every project**. They are non-negotiable.

---

## 1. TDD — Test-Driven Development (Strict)

- **Write or update tests BEFORE modifying source code.** No exceptions.
- When adding a feature: write the test first, watch it fail, then implement.
- When fixing a bug: write a test that reproduces the bug first, then fix it.
- When removing a feature: update or remove the tests first, then remove the source code.
- When refactoring: ensure tests exist and pass before and after the change.

## 2. SOLID Principles

- **Single Responsibility:** Each file, function, and class should do one thing.
- **Open-Closed:** Extend behavior through new code, not by modifying existing contracts.
- **Liskov Substitution:** Subtypes must be substitutable for their base types.
- **Interface Segregation:** Prefer small, focused interfaces over large ones.
- **Dependency Inversion:** Depend on abstractions, not concretions.

## 3. DRY — Don't Repeat Yourself

- **Before writing new code, search the codebase for existing functions, utilities, and patterns that can be reused.**
- If similar logic exists in 2+ places, extract it into a shared utility.
- Prefer importing existing helpers over duplicating logic inline.
- Use `Grep` and `Glob` to find reusable code before creating anything new.
