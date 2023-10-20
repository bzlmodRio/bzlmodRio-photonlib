package photonlibjava;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.photonvision.PhotonCamera;

class BasicTest {
  @Test
  void basicTest() {
    PhotonCamera camera = new PhotonCamera("Hello");
    assertNotNull(camera);
  }
}
