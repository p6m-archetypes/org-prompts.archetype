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

context += prompt("Venture Name:", "venture-name", #{
    help: "Joint Venture Name",
    cases: [
        CasedIdentityCasedValue(PROGRAMMING_CASES),
        FixedKeyCasedValue("venture-title", TitleCase),
    ],
});

context += set("org-venture-name", render("{{ org-name }}-{{ venture-name }}", context), #{
    cases: [
        CasedIdentityCasedValue(PROGRAMMING_CASES),
        FixedKeyCasedValue("org-venture-title", TitleCase),
    ],
});

if switch_enabled("debug-context") {
    log(Info, `${archetect::archetype::description()} (${context["org-venture-name"]}) Context:`);
    display(as_yaml(context));
}

// Return Context
context