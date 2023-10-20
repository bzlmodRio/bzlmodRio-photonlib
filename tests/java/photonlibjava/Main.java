package photonlibjava;

import org.photonvision.PhotonCamera;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    PhotonCamera camera = new PhotonCamera("Hello");
    System.out.println(camera);
  }
}
