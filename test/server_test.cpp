#include "server.hpp"

#include <catch.hpp>

TEST_CASE("Server", "[server]") {
  REQUIRE(server::serveMe() == true);
}
