let context = #{};

if switch_enabled("debug-answers") {
    log(Info, `${archetect::archetype::description()} Answers:`);
    display(as_yaml(ANSWERS));
}

context += prompt("Org Name:", "org-name", #{
    help: "Organization Name",
    cases: [
        CasedIdentityCasedValue(PROGRAMMING_CASES),
        FixedKeyCasedValue("org-title", TitleCase),
    ],
});

context += prompt("Solution Name:", "solution-name", #{
    help: "Solution Name",
    cases: [
        CasedIdentityCasedValue(PROGRAMMING_CASES),
        FixedKeyCasedValue("solution-title", TitleCase),
    ],
});

context += set("org-solution-name", render("{{ org-name }}-{{ solution-name }}", context), #{
    cases: [
        CasedIdentityCasedValue(PROGRAMMING_CASES),
        FixedKeyCasedValue("org-solution-title", TitleCase),
    ],
});

if switch_enabled("debug-context") {
    log(Info, `${archetect::archetype::description()} (${context["org-solution-name"]}) Context:`);
    display(as_yaml(context));
}

// Return Context
context