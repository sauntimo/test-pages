module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        sass: {
            dist: {
                options: {
                    style: 'expanded',
                    require: 'susy'
                },
                files: {
                    'css/style.css': 'scss/style.scss'
                }
            }
        },
        watch: {
            files: ['scss/*.scss'],
            tasks: ['sass']
        }
    });

    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');

    // Default task(s).
    grunt.registerTask('default', ['sass']);

};
