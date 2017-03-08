// Java 8 Tutorials

// Lambda expressios

// test case
List<String> names = Arrays.asList("peter", "anna", "mike", "xenia");

// prior version
Collections.sort(names, new Comparator<String>() {
    @Override
    public int compare(String a, String b) {
        return b.compareTo(a);
    }
});

// Lambda version 1
Collections.sort(names, (String a, String b) -> {
    return b.compareTo(a);
});

// Lambda version 2
Collections.sort(names, (String a, String b) -> b.compareTo(a));

// Lambda version 3
names.sort((a, b) -> b.compareTo(a));

// Lambda generalized formula from above
obj.func((params) -> overriddenReturn);

// Lambda Expression Syntax:
// Argument List + Arrow Token + Body
(int x, int y ) -> x + y

