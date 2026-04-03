#!/usr/bin/env nextflow

// Simple test workflow that uses parameters

params.greeting = "Hello"
params.name = "World"
params.count = 3

println "Workflow started with parameters:"
println "  greeting: ${params.greeting}"
println "  name: ${params.name}"
println "  count: ${params.count}"

process sayHello {
    output:
    path 'output.txt'

    script:
    """
    echo "${params.greeting}, ${params.name}!" > output.txt
    echo "This message will be repeated ${params.count} times:" >> output.txt
    for i in \$(seq 1 ${params.count}); do
        echo "  \$i: ${params.greeting}, ${params.name}!" >> output.txt
    done
    cat output.txt
    """
}

workflow {
    sayHello()
}
