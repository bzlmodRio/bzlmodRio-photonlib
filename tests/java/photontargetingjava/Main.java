package photontargetingjava;

import org.photonvision.common.dataflow.structures.Packet;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    Packet packet = new Packet(0);
    System.out.println(packet);
  }
}
