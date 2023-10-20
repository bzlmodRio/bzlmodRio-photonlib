package photontargetingjava;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.photonvision.common.dataflow.structures.Packet;

class BasicTest {
  @Test
  void basicTest() {
    Packet packet = new Packet(0);
    assertNotNull(packet);
  }
}
