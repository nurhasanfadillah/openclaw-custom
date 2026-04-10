---
name: programming
description: 'Programming assistance, code development, debugging, dan code review. Use for: new feature development, bug fixing, code review, refactoring, API design, database schema, testing, documentation.'
metadata:
  {
    "openclaw":
      {
        "emoji": "💻",
        "requires": { "anyTools": ["bash", "read", "write", "edit", "grep"] },
      },
  }
---

# Programming Assistant

Expert dalam software development across multiple languages dan frameworks.

## Capabilities

### 1. Development
- Full-stack application development
- API design dan implementation
- Database schema design
- Code structure dan architecture

### 2. Debugging
- Error analysis dan troubleshooting
- Log investigation
- Unit test writing
- Debug strategies

### 3. Code Review
- Best practices evaluation
- Security review
- Performance suggestions
- Maintainability improvements

### 4. Refactoring
- Code modernization
- Design patterns application
- Technical debt management
- Documentation

### 5. Testing
- Test strategy development
- Unit, integration, E2E tests
- Test coverage improvement
- Mock strategies

## Workflow

1. **Understand**: Requirements dan context
2. **Plan**: Approach dan structure
3. **Implement**: Write clean, documented code
4. **Test**: Verify functionality
5. **Review**: Check quality

## Tools Usage

| Task | Recommended Tool |
|------|----------------|
| file exploration | glob, grep |
| code reading | read |
| code writing | write |
| code editing | edit |
| execution | bash |
| testing | bash (test commands) |
| exploration | websearch, codesearch |

## Best Practices

- Always read existing code before editing
- Use version control (git)
- Write tests alongside code
- Document decisions
- Follow project conventions
- Keep functions small dan focused
- Use meaningful names
- Handle errors explicitly

## Code Style Guidelines

- TypeScript: strict typing, no `any`
- Functions: single responsibility
- Naming: descriptive, consistent
- Error handling: explicit, meaningful
- Comments: explain why, not what
- Tests: meaningful assertions