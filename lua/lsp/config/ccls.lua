local opts = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
}


return {
  on_setup = function(server)
    server:setup(opts)
  end,
}
